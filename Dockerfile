FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
                       && apt-get install -y nodejs

# 作業ディレクトリの作成、設定
RUN mkdir /app_name

##作業ディレクトリ名を環境変数APP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは別途事前に作成しておく）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT
