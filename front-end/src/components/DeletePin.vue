<script setup lang="ts">
import axios from 'axios'

const ip : string = import.meta.env.VITE_IP || "http://localhost:3000"
let id : string = ""


async function onSubmit() {
  await axios.delete(ip + '/pin/' + parseInt(id)).catch((error) => {
    console.log(error)
  })
}
</script>

<template>
  <form @submit.prevent="onSubmit">
    <div class="form-group">
      <label for="id">Id du pin</label>
      <input v-model="id" type="text" class="form-control" placeholder="Id" />
    </div>
    <input type="submit" value="Submit" />
  </form>
</template>
