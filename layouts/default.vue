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
  </div>
</template>
