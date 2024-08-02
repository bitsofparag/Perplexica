FROM node:slim

ARG SEARXNG_API_URL
ARG CONFIG_TOML_BASE64

WORKDIR /home/perplexica

RUN  echo "${CONFIG_TOML_BASE64}" | base64 -d > /home/perplexica/config.toml

COPY src /home/perplexica/src
COPY tsconfig.json /home/perplexica/
COPY config.toml /home/perplexica/
COPY drizzle.config.ts /home/perplexica/
COPY package.json /home/perplexica/
COPY yarn.lock /home/perplexica/

RUN sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /home/perplexica/config.toml

RUN mkdir /home/perplexica/data

RUN yarn install 
RUN yarn build

CMD ["yarn", "start"]
