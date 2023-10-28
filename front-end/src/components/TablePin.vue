<script setup lang="ts">
defineProps({
  pins: {
    type: [Object],
    required: true
  }
})

</script>

<template>
  <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Id</th>
        <th scope="col">Pin Name</th>
        <th scope="col">Longitude</th>
        <th scope="col">Latitude</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="pin in pins" :key="pin.id">
        <th scope="row">{{ pin.id }}</th>
        <td>{{ pin.name }}</td>
        <td>{{ pin.longitude }}</td>
        <td>{{ pin.latitude }}</td>
        
      </tr>
    </tbody>
  </table>
</template>
