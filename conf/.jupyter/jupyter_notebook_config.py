c = get_config()  # get the config object
c.IPKernelApp.pylab = 'inline'  # in-line figure when using Matplotlib
c.NotebookApp.ip = '*'
c.NotebookApp.allow_remote_access = True
# do not open a browser window by default when using notebooks
c.NotebookApp.open_browser = False
c.NotebookApp.token = ''  # No token. Always use jupyter over ssh tunnel
c.NotebookApp.password = ''
c.NotebookApp.notebook_dir = '/notebooks'
# Allow to run Jupyter from root user inside Docker container
c.NotebookApp.allow_root = True
c.NotebookApp.allow_origin = '*'
c.NotebookApp.disable_check_xsrf = True
c.NotebookApp.tornado_settings = {
    'headers': {
        'Content-Security-Policy': "frame-ancestors 'self' *"
    }
}
