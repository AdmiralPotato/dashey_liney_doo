<template>
  <g
    :transform="transform"
    stroke="#fff"
    stroke-width="0.25"
    fill="none"
  >
    <ellipse
      v-if="type === 'circle'"
      rx="0.55"
      ry="0.55"
    />
    <rect
      v-if="type === 'square'"
      x="-0.5"
      y="-0.5"
      width="1"
      height="1"
    />
    <rect
      v-if="type === 'diamond'"
      width="1"
      height="1"
      transform="rotate(-45) translate(-0.5,-0.5)"
    />
    <path
      v-if="type === 'cross'"
      d="M0.5,0.5 L-0.5,-0.5 M-0.5,0.5 L0.5,-0.5"
    />
  </g>
</template>

<script>
const types = [
  'circle',
  'square',
  'diamond',
  'cross',
];
export default {
  props: {
    value: {
      required: true
    }
  },
  data () {
    return {
      type: types[Math.floor(Math.random() * types.length)]
    }
  },
  computed: {
    transform () {
      return [
        `translate(${this.value.x}, ${this.value.y}) scale(4)`
      ].join(' ')
    }
  }
}
</script>
