#!/bin/bash
# should be run as root and only on Ubuntu 20/22, Debian 10/11 (Buster/Bullseye) versions!
echo "Welcome to the MediacMS installation!";

if [ "$(id -u)" -ne 0 ]
then echo "Please run as root"
    exit
fi

ADMIN_PASS=$(python -c "import secrets;chars = 'abcdefghijklmnopqrstuvwxyz0123456789';print(''.join(secrets.choice(chars) for i in range(10)))")
echo "from users.models import User; User.objects.create_superuser('admin', 'admin@example.com', '$ADMIN_PASS')" | python manage.py shell
#echo "from django.contrib.sites.models import Site; Site.objects.update(name='$FRONTEND_HOST', domain='$FRONTEND_HOST')" | python manage.py shell
echo 'Reset password: '"$ADMIN_PASS"''
echo "PASSWORD: $ADMIN_PASS" >> passwd