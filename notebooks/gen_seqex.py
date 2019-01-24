from google.protobuf import text_format
from proto.stu3 import version_config_pb2

def _get_version_config(version_config_path):
  with open(version_config_path) as f:
    return text_format.Parse(f.read(), version_config_pb2.VersionConfig())
