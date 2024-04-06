<script setup lang="ts">
interface Room {
  id: string;
  title: string;
  subtitle: string;
  image: string;
  numberOfProjects: number;
}

interface Props {
  room: Room;
}

defineProps<Props>();
</script>

<template>
  <Card>
    <template #header>
      <img class="image" :src="room.image" :alt="room.title" />
    </template>

    <template #title>{{ room.title }}</template>

    <template #subtitle>{{ room.subtitle }}</template>

    <template #content>
      <Chip>
        <span class="number">{{ room.numberOfProjects }}</span>
        <span>Projekte</span>
      </Chip>
    </template>

    <template #footer>
      <NuxtLink class="p-button" :to="`/rooms/${room.id}`"> Öffnen </NuxtLink>
    </template>
  </Card>
</template>

<style scoped>
:deep(.p-card-header) img {
  border-radius: var(--border-radius);
}

:deep(.p-chip) {
  padding-left: 0;
}

:deep(.p-chip) .number {
  background-color: var(--primary-color);
  color: var(--primary-color-text);
  border-top-left-radius: var(--border-radius);
  border-bottom-left-radius: var(--border-radius);
  min-width: 2rem;
  padding-left: 0.5rem;
  padding-right: 0.5rem;
  height: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: var(--inline-spacing);
}
</style>
