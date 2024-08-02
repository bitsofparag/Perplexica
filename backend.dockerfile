FROM node:slim

ARG SEARXNG_API_URL

WORKDIR /home/perplexica

COPY src /home/perplexica/src
COPY tsconfig.json /home/perplexica/
COPY config.toml /home/perplexica/
COPY drizzle.config.ts /home/perplexica/
COPY package.json /home/perplexica/
COPY yarn.lock /home/perplexica/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /home/perplexica/data

RUN yarn install 
RUN yarn build

ENTRYPOINT ["entrypoint.sh"]
CMD ["yarn", "start"]
