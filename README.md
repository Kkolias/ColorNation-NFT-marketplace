# ColorNation NFT Marketplace

## 📌 Projektin tarkoitus
Tämä projekti on osa oppimisprosessia Web3-kehityksestä ja NFT-markkinapaikkojen rakentamisesta. Tarkoituksena on syventää ymmärrystä Solidity-älysopimuksista, lohkoketjun toiminnasta, sekä Vue 3 -pohjaisen frontendin kehityksestä.

## 🎯 Projektin idea
ColorNation on NFT-kokoelma, jossa jokainen token edustaa tiettyä maata. Projekti tuo mukanaan ainutlaatuisen "kierrosperustaisen" minttausmekaniikan:
- Jokainen maa voidaan mintata vain kerran per kierros.
- Kun kaikki ennalta määritetyt maat on mintattu, alkaa uusi kierros.
- Tämä luo "odotusarvoa" ja dynaamisen tarjontarajoituksen.

## 🛠️ Teknologiat
- **Solidity** (ERC-721 NFT älysopimus)
- **Hardhat** (kehitysympäristö Soliditylle)
- **Vue 3** (frontend)
- **ethers.js** (lohkoketjuintegraatio)
- **MetaMask** (lompakkoyhteys)

## 🚀 Oppimistavoitteet
- Ymmärtää ERC-721 NFT-standardin toiminta
- Rakentaa turvallisia ja tehokkaita älysopimuksia Solidityllä
- Kehittää Web3-integraatio frontendin ja lohkoketjun välille
- Harjoitella NFT-markkinapaikan toimintalogiikkaa ja UX-suunnittelua

## 📄 Asennus ja käyttö
1. **Riippuvuuksien asennus**
   ```sh
   npm install
   ```
2. **Hardhat-projektin käynnistys**
   ```sh
   npx hardhat node
   ```
3. **Sopimuksen deploy**
   ```sh
   npx hardhat run scripts/deploy.js --network localhost
   ```
4. **Frontendin käynnistys**
   ```sh
   npm run dev
   ```

Tervetuloa mukaan ColorNation-projektiin! 🚀

