<template>
  <div>
    <Menubar>
      <template #start>
        <AppLogo />
      </template>

      <template #end>
        <Avatar shape="circle" />
      </template>
    </Menubar>

    <slot />

    <footer>
      <NuxtLink to="/privacy-policy">Datenschutzerklärung</NuxtLink>
      <NuxtLink to="/imprint">Impressum</NuxtLink>
    </footer>
  </div>
</template>

<style scoped>
footer {
  display: flex;
  justify-content: center;
  column-gap: var(--inline-spacing);
}
</style>
