<template>
  <div class="component-ColorNationNFTList">
    <ul>
      <li v-for="nft in NFTList">
        <img :src="nft.uri" alt="NFT" />
      </li>
    </ul>
  </div>
</template>

<script lang="ts">

export default {
  props: {
    NFTList: {
      type: Array as () => any[],
      default: () => []
    },
  },
}
</script>

<style lang="less" scoped>
.component-ColorNationNFTList {
  padding: 20px;
  ul,
  li {
    list-style: none;
    padding: 0;
    margin: 0;

    img {
      max-width: 200px;
    }
  }

  ul {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
  }
}
</style>
