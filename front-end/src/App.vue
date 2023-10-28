<script setup lang="ts">
import Create from './components/CreatePin.vue'
import Table from './components/TablePin.vue'
import Update from './components/UpdatePin.vue'
import Delete from './components/DeletePin.vue'
import axios from 'axios'
import { nextTick, onMounted, ref } from 'vue'

const ip : string = import.meta.env.VITE_IP || "http://localhost:3000"
const toto = import.meta.env
let pins: Object = []
const renderComponent = ref(true)
let helloFromBack : String = ""

onMounted(async () => {
  await getPins()
  await getHello()
  await reload()
})

async function getHello() {
  const requestData = await axios.get(ip + "/")
  helloFromBack = requestData.data
}

async function reload() {
  renderComponent.value = false
  await nextTick()
  renderComponent.value = true
}
async function getPins() {
  const requestData = await axios.get(ip + '/pins')
  pins = requestData.data
  await reload()
}
</script>

<template>
  <main>
    <p>{{ ip }}</p>
    <p> {{  toto  }}</p>
    <h1>{{ helloFromBack }}</h1>
    <button type="button" class="btn btn-danger" @click="getPins">Get pins</button>
    <Create></Create>
    <Table :pins="pins" v-if="renderComponent"></Table>
    <Update></Update>
    <Delete></Delete>
  </main>
</template>
