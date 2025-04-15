// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFTMarket is Ownable,ERC721URIStorage{


    uint256  public listPrice;

    struct ListedToken{
        uint256 tokenId;
        uint256 listPrice;
        uint256 price;
        bool isListed;
        address owner;
        address seller;
    }
    
    constructor() Ownable(msg.sender) ERC721("C2NMarket","C2NM"){


    }

    //owner function 
    function updateListPrice(uint256 _listPrice) external  onlyOwner{
        listPrice=_listPrice;
    }



    //seller function

    function createToken(string memory _tokenURI,uint256 price) external  payable {
        //check price
        uint 
        //check list price
        require(msg.value==listPrice,"need send enough list price");
        //mint token
        //create listedToken
        //transfer token to nftmarket
    }




    //trader function 



}