// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ColorNation is ERC721, ERC721URIStorage, ERC721Enumerable, Ownable {
    uint256 private _tokenCounter;

    uint256 public currentRound = 1;
    mapping(uint256 => mapping(string => bool)) public roundMints;
    mapping(uint256 => uint256) public roundMintedCount;
    string[] public countries;
    uint256 public maxMintsPerRound;

    event CountryMinted(address indexed user, string country, uint256 tokenId);

    constructor(
        string memory name,
        string memory symbol,
        string[] memory _countries
    ) ERC721(name, symbol) Ownable(msg.sender) {
        _tokenCounter = 0;
        countries = _countries;
        maxMintsPerRound = _countries.length;
    }

    function getUserTokens(
        address owner
    ) public view returns (uint256[] memory, string[] memory) {
        uint256 count = balanceOf(owner);
        uint256[] memory tokenIds = new uint256[](count);
        string[] memory uris = new string[](count);

        for (uint256 i = 0; i < count; i++) {
            uint256 tokenId = tokenOfOwnerByIndex(owner, i);
            tokenIds[i] = tokenId;
            uris[i] = tokenURI(tokenId);
        }

        return (tokenIds, uris);
    }

    function mintCountry(
        string memory country,
        string memory _tokenURI
    ) public {
        require(
            !roundMints[currentRound][country],
            "This country has already been minted this round"
        );

        require(
            roundMintedCount[currentRound] < maxMintsPerRound,
            "All countries have been minted for this round"
        );

        // mint nft
        uint256 tokenId = getNewTokenId();
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI); // TODO korvataan tää myöhemmin automaattisella kuvan generoinnilla

        // set metadata
        roundMints[currentRound][country] = true;
        roundMintedCount[currentRound]++;
        _tokenCounter++;

        emit CountryMinted(msg.sender, country, tokenId);

        if (roundMintedCount[currentRound] == maxMintsPerRound) {
            currentRound++;
        }
    }

    function getNewTokenId() private view returns (uint256) {
        return _tokenCounter;
    }

    // Override required by Solidity
    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721, ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function burn(uint256 tokenId) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "Caller is not owner nor approved"
        );
        _update(address(0), tokenId, address(0));
    }

    function _increaseBalance(
        address account,
        uint128 amount
    ) internal virtual override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, amount);
    }

    function _isApprovedOrOwner(
        address sender,
        uint256 tokenId
    ) internal view returns (bool) {
        address ownerOfToken = ownerOf(tokenId);

        bool isOwner = ownerOfToken == sender;
        bool isApproved = getApproved(tokenId) == sender;
        bool isOperator = isApprovedForAll(ownerOfToken, sender);

        return isOwner || isApproved || isOperator;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721Enumerable, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
