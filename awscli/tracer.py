import threading
import sys
from inspect import getframeinfo, getouterframes, currentframe
from types import FrameType
import os
import re

lines = []

# '/Users/yoshinariyamanaka/source-code/AWS/aws-cli/output/lib/aws-cli/bin',
# '/Users/yoshinariyamanaka/.pyenv/versions/3.11.6/lib/python311.zip',
# '/Users/yoshinariyamanaka/.pyenv/versions/3.11.6/lib/python3.11',
# '/Users/yoshinariyamanaka/.pyenv/versions/3.11.6/lib/python3.11/lib-dynload',
# '/Users/yoshinariyamanaka/source-code/AWS/aws-cli/output/lib/aws-cli/lib/python3.11/site-packages'
builtin_path = [ f for f in sys.path if (not re.match(r"/.+/lib/aws-cli/bin", f)) and (not re.match(r"/.+/lib/aws-cli/lib/.+/site-packages", f)) ]

def is_builtin(file_path: str):
    return any([ file_path.startswith(f) for f in builtin_path ])

def trace_dispatch(frame: FrameType, event: str, arg, depth=[0]):
    """
    The event can be one of the following:
        line: A new line of code is going to be executed.
        call: A function is about to be called or another code block
                is entered.
        return: A function or other code block is about to return.
        exception: An exception has occurred.
        c_call: A C function is about to be called.
        c_return: A C function has returned.
        c_exception: A C function has raised an exception.

    For the Python events, specialized functions (see the dispatch_*()
        methods) are called.  For the C events, no action is taken.

    The arg parameter depends on the previous event.
    """
    file_path = os.path.abspath(frame.f_code.co_filename)

    if is_builtin(file_path=file_path):
        return
    if file_path.endswith("/site-packages/awscli/botocore/docs/docstring.py"):
        return
    if "<frozen " in file_path:
        return

    current_thread = threading.current_thread().name

    string_format = "{}, {}, {}, {}, {}, {}".format(
        current_thread, file_path, frame.f_lineno, frame.f_code.co_name, event, arg
    )
    if event == 'line':
        lines.append(string_format)
        return trace_dispatch
    if event == 'call':
        depth[0] += 1
        lines.append(string_format)
        return trace_dispatch
    if event == 'return':
        lines.append(string_format)
        depth[0] -= 1
        return trace_dispatch
    if event == 'exception':
        lines.append(string_format)
        return trace_dispatch
    if event == 'c_call':
        lines.append(string_format)
        return trace_dispatch
    if event == 'c_exception':
        lines.append(string_format)
        return trace_dispatch
    if event == 'c_return':
        lines.append(string_format)
        return trace_dispatch
    return trace_dispatch
