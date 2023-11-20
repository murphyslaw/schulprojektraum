<template>
  <div class="logo">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
      <path
        fill="var(--primary-color)"
        d="m12 18.483-5.003-2.737v-4.322l-2.86-1.585L12 5.517l7.862 4.322v5.762h-1.43v-4.97l-1.43.793v4.322zm0-5.979 4.896-2.665L12 7.174 7.104 9.839zm0 4.34 3.573-1.945V12.18L12 14.16l-3.574-1.98v2.72L12 16.843M0 24v-6.667h2.667v4h4V24zm17.333 0v-2.667h4v-4H24V24zM0 6.667V0h6.667v2.667h-4v4zm21.333 0v-4h-4V0H24v6.667z"
      />
    </svg>

    <span>Schulprojektraum</span>
  </div>
</template>

<style scoped>
.logo {
  display: flex;
  align-items: center;
  column-gap: var(--inline-spacing);
}

.logo span {
  font-family: var(--font-family);
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--text-color);
}
</style>
