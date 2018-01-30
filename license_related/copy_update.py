#!/usr/bin/env python3

# Prepare data:
"""
ag Copyright src -l > copylist.txt
paste copylist.txt <( <copylist.txt xargs -n1  git log --diff-filter=A --follow --format=%aD -1 -- | cut -f4 -d ' ') > copylist_years
cd <PATH_TO_PROJECT>
python3 <PATH_TO_SCRIPT> copylist_years -n true
"""

# Example
# Author: Copyright (C) Szczepan Zalega Date: 2018-01-30
# Copyright (c) 2018 Nitrokey UG


import logging

import click
import regex as re
from logging import getLogger

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.DEBUG)
log = getLogger()

COPY_RE_S = r'.*Copyright \(c\) \d+-\d+ Nitrokey UG.*'
COPY_RE = re.compile(COPY_RE_S, re.IGNORECASE)

DRY_RUN = True


def match_copyline(line):
    return COPY_RE.match(line)


def fix_year(line, year, prev_line):
    # quick-fix rules for authors' copyrights, as in example
    if '2012' in prev_line:
        year = '2012'
    if '2013' in prev_line:
        year = '2013'
    if year == '2018':
        # TODO replace years range in provided string instead of putting own
        return ' * Copyright (c) {} Nitrokey UG\n'.format('2018')
    return ' * Copyright (c) {}-{} Nitrokey UG\n'.format(year, '2018')


def replace_copy(fname, year):
    fname = './' + fname
    log.debug('Opening {}'.format(fname))
    with open(fname, 'r') as f:
        lines = f.readlines()
    for i, line in enumerate(lines):
        if match_copyline(line):
            log.debug('Found at line {}'.format(i))
            nline = fix_year(line, year, lines[i - 1] if i > 0 else None)
            log.debug('{} => {}'.format(line.strip(), nline.strip()))
            lines[i] = nline
            if DRY_RUN:
                print('{}:{} {} => {}'.format(fname, i, line.strip(), nline.strip()))
            break
    if not DRY_RUN:
        with open(fname, 'w') as f:
            f.writelines(lines)


@click.command()
@click.argument('list_fname', type=click.Path(exists=True))
@click.option('-n', help='dry run (print summary to console)', type=bool)
def process(list_fname, n):
    global DRY_RUN
    DRY_RUN = n
    log.debug('Opening {}'.format(list_fname))
    with open(list_fname, 'r') as f:
        lines = f.readlines()
    log.debug('Read {} items'.format(len(lines)))
    for item in lines:
        item = item.strip()
        src_file_name, year = item.split()
        replace_copy(src_file_name, year)


if __name__ == "__main__":
    process()
