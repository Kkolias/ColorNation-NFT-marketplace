<template>
  <div class="component-MintColorNation">
    <input v-model="country" placeholder="Country" />
    <button @click="mintColorNation()">Mint ColorNation</button>
  </div>
</template>

<script lang="ts">
import walletMixin from '@/mixins/walletMixin'
import { getContract } from '../../utils/getContract'

const TEST_URL_FOR_COUNTRY = {
  finland:
    'https://cdn.suwalls.com/wallpapers/digital-art/finland-flag-with-paint-drops-52024-1920x1080.jpg',
  sweden:
    'https://cdn.suwalls.com/wallpapers/digital-art/paint-drops-on-the-flag-of-sweden-52662-1920x1080.jpg',
  norway:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWa5OjmQcFyl3_XPCOzlj9_gFNVlD8nR2-egSmP_77oIHtpfCjFToIfqMpTnaHT-T49fE&usqp=CAU',
} as any

export default {
  mixins: [walletMixin],
  data: () => ({
    country: '',
  }),
  methods: {
    async mintColorNation() {
      const contract = await getContract()
      const tx = await contract.mintCountry(
        this.country,
        TEST_URL_FOR_COUNTRY?.[this.country] || 'no-url',
      )
      await tx.wait()

      this.$emit('reloadList')
    },
  },
}
</script>
