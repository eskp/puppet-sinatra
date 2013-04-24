from fabric.api import *
from fabric.contrib.console import confirm


@task
def host(fqdn):
    """specify which host to work on"""
    
    env.hosts = ['root@%s' % fqdn]

@task
def setup():
    """prepare server for puppet"""
    
    run('apt-get update')
#    run('apt-get -y dist-upgrade')
    run('apt-get install -q -y git-core puppet lsb-release')

    # Set IP/FQDN/short name in /etc/hosts file
    #ip = run('ifconfig eth0 | grep "inet addr" | awk \'{print $2}\' | cut -d: -f2')
    #node_name = env.host.split('.')[0]
    #t = jinja2.Template("127.0.0.1\tlocalhost localhost.localdomain\n{{ip}}\t{{fqdn}} {{name}}\n\n")
    #f = open('templates/hosts', 'wa')
    #f.write(t.render(ip=ip, fqdn=env.host, name=node_name))
    #f.close()
    #put('templates/hosts', '/etc')

    # Set FQDN in /etc/hostname
    run('echo %s > /etc/hostname' % env.host)
    run('hostname -F /etc/hostname')

    # Set to Australia/Melbourne timezone
    timezone = 'Australia/Melbourne'
    run('echo %s > /etc/timezone' % timezone)
    run('cp -f /usr/share/zoneinfo/%s /etc/localtime' % timezone)


@task
def puppet_init():
    """clone puppet repository on the server for the first time"""
    
    with cd('/opt'):
        run('git clone https://github.com/eskp/puppet-sinatra.git')
    with cd('/opt/puppet-sinatra'):
        run('git submodule init')
        run('git submodule update')

@task
def puppet_run(noop=False):
    """
    runs puppet on remote host
    invoke with puppet_run:noop to run in 'noop' mode
    """
    cmd = 'cd /opt/puppet-sinatra && git pull origin master'
    print local('ssh -A %s "%s"' % (env.host_string, cmd))
    if noop:
        run('puppet apply --noop --verbose /opt/puppet-sinatra/init.pp --modulepath=/opt/puppet-sinatra/modules')
    else:
        run('puppet apply --verbose /opt/puppet-sinatra/init.pp --modulepath=/opt/puppet-sinatra/modules')

