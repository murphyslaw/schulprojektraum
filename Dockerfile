ARG NODE_VERSION=20.9.0
ARG WORKDIR=/app
ARG PORT=3000

################################################################################
FROM node:${NODE_VERSION}-alpine AS base

ARG WORKDIR

RUN npm install -g npm@latest

WORKDIR ${WORKDIR}

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

COPY . .

################################################################################
FROM base AS dev

ARG WORKDIR
ARG PORT

ENV NODE_ENV=development
ENV PORT=${PORT}
ENV SERVER="${WORKDIR}/node_modules/.bin/nuxt"

CMD node ${SERVER} dev

################################################################################
FROM base AS build

RUN npm run build
RUN npm prune

################################################################################
FROM base AS prod

ARG WORKDIR
ARG PORT

ENV NODE_ENV=production
ENV PORT=${PORT}
ENV SERVER=.output/server/index.mjs

COPY --from=build --chown=node:node ${WORKDIR}/.output .output

USER node

EXPOSE ${PORT}

CMD node ${SERVER}
