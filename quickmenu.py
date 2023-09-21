from mako.template import Template
from datetime import datetime
import argparse
import zipfile
import os.path


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATE_PATH = os.path.join(BASE_DIR, "quickmenu.mako")

GAME_MODES = (
    'aimduel', 'cra_ft', 'ica', 'ictf', 'idm', 'iduel', 'ift', 'ikh', 'irace', 'itdm', 'nexball', 'okctf',
    'sumo', 'ca', 'ctf', 'dm', 'duel', 'kh', 'tdm'
)


def build_quickmenus(output_dir):
    quickmenu_template = Template(filename=TEMPLATE_PATH)

    def build_menu(menu_fmt, **ctx):
        menu_filename = menu_fmt.format(**ctx)
        with output_dir.open(menu_filename) as f:
            data = quickmenu_template.render(**ctx).encode('utf-8')
            f.write(data)

    build_menu("quickmenu-{server}.txt", server="pub")
    for server in ('votable', 'mars'):
        for mode in GAME_MODES:
            build_menu("quickmenu-{server}-{mode}.txt", server=server, mode=mode)


def main(args=None):
    parser = argparse.ArgumentParser(description="Tool that builds regulars quickmenu")
    parser.add_argument('output', type=argparse.FileType('wb'), help='Output pk3 file path')
    namespace = parser.parse_args(args)
    output_file = namespace.output
    pk3_path, pk3_name = os.path.split(output_file.name)
    with zipfile.ZipFile(output_file, mode='w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as pk3:
        time_tuple = tuple(datetime.utcnow().timetuple())[:6]
        real_open = pk3.open

        def patched_open(filename, *args, **kw):
            file_info = zipfile.ZipInfo(filename, date_time=time_tuple)
            file_info.compress_type = zipfile.ZIP_DEFLATED
            return real_open(file_info, mode='w')

        pk3.open = patched_open

        build_quickmenus(pk3)
        with pk3.open("{0}.serverpackage".format(pk3_name)) as serverpackage:
            serverpackage.write(b"Regulars quickmenu files")


if __name__ == '__main__':
    main()
