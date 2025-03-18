<template>
  <div class="component-Navigation">
    <div class="grid-container">
        <h2>ColorNation NFT</h2>
        
        <div class="center">{{ walletShortAddress }}</div>
    </div>
    <button v-if="!walletAddress" @click="handleConnectWallet()">Connect wallet</button>
    <button v-if="walletAddress" @click="discounnectWallet()">Disconnect wallet</button>
  </div>
</template>

<script lang="ts">
import walletMixin from '@/mixins/walletMixin'

export default {
  mixins: [walletMixin],
  methods: {
    handleConnectWallet() {
      this.connectWallet()
    }
  }
}
</script>

<style lang="less" scoped>
.component-Navigation {
  width: 100%;
  height: 60px;
  position: relative;

  padding: 10px;

  h2 {
    height: 40px;
    display: inline-block;
    line-height: 40px;
  }

  button {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
  }

  .grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr;

    .center {
        height: 40px;
        line-height: 40px;
    }
  }
}
</style>
