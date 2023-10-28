<script setup lang="ts">
import axios from 'axios'
import { nextTick, ref } from 'vue';
const ip : string = import.meta.env.VITE_IP || "http://localhost:3000"
const renderComponent = ref(true)
async function reload() {
  renderComponent.value = false
  await nextTick()
  renderComponent.value = true
}

let name = ''
let longitude = ''
let latitude = ''

async function onSubmit() {
  await axios
    .post(ip + '/pin', {
      name: name,
      longitude: parseFloat(longitude),
      latitude: parseFloat(latitude)
    })
    .catch(function (error) {
      console.log('error' + error)
    })
}
</script>

<template>
  <form @submit.prevent="onSubmit">
      <div class="form-group">
        <label for="name">Nom du pin</label>
        <input v-model="name" type="text" class="form-control" placeholder="Nom du pin" />
      </div>
      <div class="form-group">
        <label for="longitude">Longitude</label>
        <input v-model="longitude" type="text" class="form-control" placeholder="Longitude" />
      </div>
      <div class="form-group">
        <label for="latitude">Latitude</label>
        <input v-model="latitude" type="text" class="form-control" placeholder="Latitude" />
      </div>
      <input type="submit" value="Submit" />
    </form>
</template>
