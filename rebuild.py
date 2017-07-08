#!/usr/bin/env python3
from mako.template import Template
import logging
import sys
import os


BASE_PATH = os.path.dirname(os.path.abspath(__file__))
PREFIXES = ["DP", "RCON", "XON"]

def filtered_environment():
    new_dct = {}
    for key, value in os.environ.items():
        for prefix in PREFIXES:
            if key.startswith(prefix):
                new_dct[key] = value
                break

    return new_dct


def update_auth_file(new_data):
    auth_path = os.path.join(BASE_PATH, "configs", "auth.cfg")
    with open(auth_path, "w") as f:
        f.write(new_data)

    os.chmod(auth_path, 0o0600)


def main():

    if 'RCON_PASSWORD' not in os.environ:
        print("Please define RCON_PASSWORD environment variable")
        sys.exit(1)

    auth_template_path = os.path.join(BASE_PATH, "configs", "auth.cfg.template")
    auth_template = Template(filename=auth_template_path, strict_undefined=False)
    try:
        auth_file = auth_template.render(**filtered_environment())
    except NameError as exc:
        logging.error(exc)
        sys.exit(1)
    else:
        update_auth_file(auth_file)


if __name__ == "__main__":
    main()
