<script setup lang="ts">
import type { DropdownChangeEvent } from "primevue/dropdown";

const rooms = [
  {
    id: "1",
    title: "Deutsch Skandinavische Gemeinschaftsschule",
    subtitle: "Schulhackathon 2023",
    image: "https://picsum.photos/200",
    numberOfProjects: 5,
  },
  {
    id: "2",
    title: "Semper Oberschule Dresden",
    subtitle: "Schulhackathon 2023",
    image: "https://picsum.photos/200",
    numberOfProjects: 15,
  },
  {
    id: "3",
    title: "Bamboo Watch",
    subtitle: "Future Voices",
    image: "https://picsum.photos/200",
    numberOfProjects: 143,
  },
];

const sortOptions = ref([
  { label: "Nach Titel sortieren", value: "title" },
  { label: "Nach Untertitel sortieren", value: "subtitle" },
  { label: "Nach Anzahl der Projekte sortieren", value: "!numberOfProjects" },
]);
const sortKey = ref(sortOptions.value[0]);
const sortOrder = ref();
const sortField = ref();

const onSortChange = (event: DropdownChangeEvent) => {
  const value = event.value.value;
  const sortValue = event.value;

  if (value.indexOf("!") === 0) {
    sortOrder.value = -1;
    sortField.value = value.substring(1, value.length);
    sortKey.value = sortValue;
  } else {
    sortOrder.value = 1;
    sortField.value = value;
    sortKey.value = sortValue;
  }
};

const layout = ref("grid" as "grid" | "list");
</script>

<template>
  <div>
    <DataView
      :value="rooms"
      data-key="id"
      paginator
      :rows="4"
      :sort-order="sortOrder"
      :sort-field="sortField"
      :layout="layout"
    >
      <template #header>
        <Dropdown
          v-model="sortKey"
          :options="sortOptions"
          option-label="label"
          placeholder="Sortieren nach..."
          @change="onSortChange($event)"
        />

        <DataViewLayoutOptions v-model="layout" />
      </template>

      <template #list="slotProps">
        <div v-for="(room, index) in slotProps.items" :key="index">
          <RoomCard :room="room" />
        </div>
      </template>

      <template #grid="slotProps">
        <div v-for="(room, index) in slotProps.items" :key="index">
          <RoomCard :room="room" />
        </div>
      </template>
    </DataView>
  </div>
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

:deep(.p-dataview-header) {
  display: flex;
  flex-direction: row;
  justify-content: right;
  column-gap: var(--inline-spacing);
}

:deep(.p-dataview-content) {
  display: grid;
  gap: var(--content-padding);
}

:deep(.p-dataview-list .p-dataview-content) {
  grid-template-columns: 1fr;
}

:deep(.p-dataview-list .p-card) {
  display: flex;
  flex-direction: row;
  align-items: center;
  column-gap: var(--inline-spacing);
  padding: var(--content-padding);
}

:deep(.p-dataview-grid .p-dataview-content) {
  grid-template-columns: 1fr 1fr;
}

:deep(.p-dataview-grid .p-card) {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  column-gap: var(--inline-spacing);
  padding: var(--content-padding);
}
</style>
