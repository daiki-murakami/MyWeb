# Rubyをインストール
FROM ruby:2.6
ENV LANG C.UTF-8

# 必要なパッケージをインストール
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# 環境変数を設定
ENV APP_HOME /app

# ディレクトリの作成と移動
WORKDIR $APP_HOME

# ホストのGemfileなどをコンテナへコピー
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

# BundlerでGemをインストール
RUN gem install listen
RUN bundle install

# 設定ファイル書き換え（既存のアプリをマウントする場合は不要）
ADD . $APP_HOME

# マウントできるように公開
VOLUME $APP_HOME/public
VOLUME $APP_HOME/tmp

# コンテナ起動時にRailsサーバを起動
CMD ["rails", "server"]
