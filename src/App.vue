<template>
  <svg
    class="app"
    viewBox="-100 -100 200 200"
  >
    <rect
      x="-100"
      y="-100"
      width="200"
      height="200"
      stroke-width="1"
      stroke="#fff"
    />
    <dot
      v-for="(dot, index) in dots"
      :key="index"
      :value="dot"
    />
    <path
      stroke="#fff"
      stroke-width="1"
      stroke-dasharray="4"
      fill="none"
      :d="pathData"
    />
  </svg>
</template>

<style>
body {
  padding: 0;
  margin: 0;
  background-color: #000;
}
.app {
  height: 100vh;
  width: 100vw;
  position: absolute;
}
</style>

<script>
import Dot from './components/Dot.vue'

export default {
  components: {
    Dot
  },
  data () {
    return {
      dots: [
        {x: 0, y: 0},
        {x: 50, y: 50},
        {x: 50, y: -50}
      ]
    }
  },
  created () {
    for (let i = 0; i < 20; i++) {
      this.dots.push({
        x: (Math.random() - 0.5) * 200,
        y: (Math.random() - 0.5) * 200
      })
    }
  },
  computed: {
    pathData () {
      const dots = this.dots.slice()
      const firstPoint = dots.shift()
      return [
        `M${firstPoint.x},${firstPoint.y}`,
        ...dots.map((p) => `L${p.x},${p.y}`)
      ].join( ' ')
    }
  }
}
</script>
