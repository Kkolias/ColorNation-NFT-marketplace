<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navigation from './components/Navigation.vue';
</script>

<template>
  <header>
    <div class="wrapper">
      <Navigation />

      <!-- <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
      </nav> -->
    </div>
  </header>

  <RouterView />
</template>

<style scoped>


</style>
