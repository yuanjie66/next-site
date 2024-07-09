# 一阶段打包
FROM node:18-alpine AS builder

WORKDIR /druidgo

# COPY package.json yarn.lock ./
# RUN yarn

COPY . ./
# RUN yarn build

# 二阶段打包
ENV NODE_ENV production

FROM node:18-alpine AS runner

WORKDIR /druidgo

COPY --from=builder --chown=nextjs:nodejs /druidgo/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /druidgo/.next/static ./.next/static

EXPOSE 3000
ENV PORT 80

ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"]
