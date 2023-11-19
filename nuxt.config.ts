// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  typescript: {
    strict: true,
  },
  css: [
    "primevue/resources/themes/lara-light-purple/theme.css",
    "primeicons/primeicons.css",
  ],
  modules: ["nuxt-primevue"],
  primevue: {
    options: {
      ripple: true,
    },
    components: {
      include: [],
    },
  },
});
