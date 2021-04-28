FROM gotechnies/php-5.6-alpine

WORKDIR /var/www/html

COPY ./20180706_novinano_ts_976c110733e7eff58704180706072907_installer.php ./20180706_novinano_ts_976c110733e7eff58704180706072907_installer.php
COPY ./20180706_novinano_ts_976c110733e7eff58704180706072907_archive.zip ./20180706_novinano_ts_976c110733e7eff58704180706072907_archive.zip

RUN rm -rf index.html
RUN chmod a+w /var /var/www /var/www/html
