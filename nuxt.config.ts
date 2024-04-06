// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  app: {
    head: {
      htmlAttrs: {
        lang: "de",
      },
      meta: [
        {
          charset: "utf-8",
        },
        {
          name: "viewport",
          content: "width=device-width, initial-scale=1",
        },
        {
          name: "description",
          content:
            "Sicherer, digitaler Raum für Schulen zur Präsentation der Projekte ihrer Schüler*innen.",
        },
      ],
      title: "Schulprojektraum",
      link: [
        {
          rel: "icon",
          href: "/favicon.ico",
          type: "image/x-icon",
          sizes: "32x32",
        },
        {
          rel: "icon",
          href: "icon.svg",
          type: "image/svg+xml",
        },
        {
          rel: "apple-touch-icon",
          href: "/apple-touch-icon",
        },
        {
          rel: "manifest",
          href: "/manifest.webmanifest",
        },
      ],
    },
  },
  devtools: { enabled: true },
  typescript: {
    strict: true,
  },
  css: [
    "primevue/resources/themes/lara-light-purple/theme.css",
    "primeicons/primeicons.css",
    "/assets/tokens.css",
  ],
  modules: ["nuxt-primevue"],
  primevue: {
    options: {
      ripple: true,
    },
    components: {
      include: [
        "Avatar",
        "Menubar",
        "DataView",
        "DataViewLayoutOptions",
        "Button",
        "Dropdown",
        "Card",
        "Chip",
      ],
    },
  },
});
