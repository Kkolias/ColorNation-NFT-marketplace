<template>
    <div class="component-ColorNationNFTList">
        <ul>
            <li v-for="nft in NFTList">
                <p>{{ nft.id }}</p>
                <img :src="nft.uri" alt="NFT" />
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
import walletMixin from '@/mixins/walletMixin';
import { fetchColorNationNFTListOfUser } from '../../utils/fetchColorNationNFTList';

export default {
    mixins: [walletMixin],
    data: () => ({
        NFTList: []
    }),
    computed: {
        
    },
    watch: {
        walletAddress() {
            this.fetchColorNationNFTList()
        }
    },
    methods: {
        async fetchColorNationNFTList() {
            const [ids, uris] = await fetchColorNationNFTListOfUser(this.walletAddress)
            console.log(ids, uris)

            this.NFTList = this.parseNFTList(ids, uris)

        },
        parseNFTList(ids: string[], uris: string[]) {
            return ids.map((id, index) => {
                return { id: parseInt(id), uri: uris[index] }
            })
        }
    }
}
</script>

<style lang="less" scoped>
.component-ColorNationNFTList {
    padding: 20px;
    ul, li {
        list-style: none;
        padding: 0;
        margin: 0;

        img {
            max-width: 100px;
        }
    }
}
</style>