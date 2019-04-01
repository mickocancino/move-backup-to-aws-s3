#!/bin/bash
latest=/backup2/weekly

cd /backup2/weekly && find . -type f -iname '*.tar.gz' -exec mv -v {} $latest/ \;

/root/s3cmd-1.6.1/s3cmd --access_key=AKIAIWESRGSK25YB6TDQ --secret_key=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 sync $latest/ s3://cpanelaccounts/


cd $latest && find . -type f -ctime +10 -exec rm -f {} \;
