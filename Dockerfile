ARG NODE_VERSION=20.9.0
ARG WORKDIR=/app
ARG PORT=3000

################################################################################
FROM node:${NODE_VERSION}-alpine AS base

ARG WORKDIR

RUN npm install -g npm@latest

WORKDIR ${WORKDIR}

################################################################################
FROM base AS dev

ARG PORT

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

COPY . .

ENV NODE_ENV=development
ENV PORT=${PORT}

CMD [ "node", "/app/node_modules/.bin/nuxt", "dev" ]

################################################################################
FROM base AS build

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

COPY . .

RUN npm run build
RUN npm prune

################################################################################
FROM base AS prod

ARG WORKDIR
ARG PORT

ENV NODE_ENV=production
ENV PORT=${PORT}

COPY --from=build --chown=node:node ${WORKDIR}/.output .output

USER node

EXPOSE ${PORT}

CMD [ "node", ".output/server/index.mjs" ]
