<template>
    <h2 v-if="numb === 0">The number is zero</h2>
    <h2 v-else-if="numb === 2">The number is two</h2>
    <h2 v-else>The number is different</h2>
    <div v-show="isDivDisplayed" >
        <ul>
            <li>One</li>
            <li>Two</li>
            <li>Three</li>
        </ul>
    </div>

</template>

<script>
export default {
  name: "App",
  data() {
    return {
      numb: 5,
      isDivDisplayed: false,
    };
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
