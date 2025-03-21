<template>
  <div class="component-ColorNationPage">
    <MintColorNation @reloadList="fetchColorNationNFTList" />
    <ColorNationNFTList :NFTList="NFTList" />
  </div>
</template>

<script lang="ts">
import ColorNationNFTList from '@/components/ColorNationNFTList.vue'
import MintColorNation from '@/components/MintColorNation.vue'
import walletMixin from '@/mixins/walletMixin'
import { fetchColorNationNFTListOfUser } from '../../utils/fetchColorNationNFTList'

export default {
  mixins: [walletMixin],
  components: {
    ColorNationNFTList,
    MintColorNation,
  },
  data: () => ({
    NFTList: [],
  }),
  watch: {
    walletAddress() {
      this.fetchColorNationNFTList()
    },
  },
  methods: {
    async fetchColorNationNFTList() {
      const [ids, uris] = await fetchColorNationNFTListOfUser(this.walletAddress)

      this.NFTList = this.parseNFTList(ids, uris)
    },
    parseNFTList(ids: string[], uris: string[]) {
      return ids.map((id, index) => {
        return { id: parseInt(id), uri: uris[index] }
      })
    },
  },
}
</script>

<style lang="less" scoped>
.component-ColorNationPage {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}
</style>
