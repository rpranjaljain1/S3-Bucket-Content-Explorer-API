from flask import Flask, jsonify
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

app = Flask(__name__)

# Configure your AWS credentials and S3 bucket name
AWS_REGION = "us-east-1"  # Change as needed
BUCKET_NAME = "api-call-1234567890f"  # Replace with your bucket name 

# Initialize the S3 client
s3_client = boto3.client('s3', region_name=AWS_REGION)

def list_s3_objects(prefix=''):
    try:
        response = s3_client.list_objects_v2(Bucket=BUCKET_NAME, Prefix=prefix)

        if 'Contents' not in response or len(response['Contents']) == 0:
            raise FileNotFoundError(f"No objects found with prefix: '{prefix}'")

        directories = set()
        files = []

        for obj in response['Contents']:
            key = obj['Key'][len(prefix):]  # Remove the prefix from the key
            if key == "":
                continue
            parts = key.split('/', 1)

            if len(parts) > 1:  # It's a directory
                directories.add(parts[0])
            else:  # It's a file
                files.append(parts[0])

        return {"directories": list(directories), "files": files}
    except NoCredentialsError:
        raise Exception("AWS credentials not configured.")
    except PartialCredentialsError:
        raise Exception("Incomplete AWS credentials.")
    except FileNotFoundError as e:
        raise e
    except Exception as e:
        raise Exception(f"Error: {str(e)}")

@app.route('/list-bucket-content/', defaults={'prefix': ''}, methods=['GET'])
@app.route('/list-bucket-content/<path:prefix>', methods=['GET'])
def list_bucket_content(prefix):
    try:
        # Ensure prefix ends with a slash for consistent behavior
        if prefix and not prefix.endswith('/'):
            prefix += '/'

        result = list_s3_objects(prefix)
        if prefix == '':
            # Top-level content: Return directories only
            return jsonify({"content": result['directories']}), 200
        else:
            # Path content: Return files and directories together
            return jsonify({"content": result['files'] + result['directories']}), 200
    except FileNotFoundError as e:
        return jsonify({"error": str(e)}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    # Run the Flask app
    #app.run(host='0.0.0.0', port=5000)
    app.run(host='0.0.0.0', port=443, ssl_context=('selfsigned.crt', 'selfsigned.key'))  # Use HTTPS

