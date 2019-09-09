#/bin/sh
cd /opt
git clone ${GIT_REPOSITRY}
# python /opt/${PROJECT_NAME}/manage.py shell_plus --notebook
python /opt/${PROJECT_NAME}/manage.py makemigrations
python /opt/${PROJECT_NAME}/manage.py migrate
pip freeze > /opt/${PROJECT_NAME}/requirements.txt
if [ $ENVIROMENT="PROD" ]; then
    uwsgi --http :8001 --module blog.wsgi
else
    python /opt/${PROJECT_NAME}/manage.py runserver 0.0.0.0:8000
fi