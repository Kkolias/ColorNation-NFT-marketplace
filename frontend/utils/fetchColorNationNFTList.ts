import { ethers } from "ethers";
import config from "../config.json";

const contractAddress = config.contractAddress;
const contractABI = config.contractABI;


export async function fetchColorNationNFTListOfUser(address: string) {
  if (!(window as any).ethereum) throw new Error("MetaMask not installed");

  console.log(address)
  
  const provider = new ethers.BrowserProvider((window as any).ethereum);
  const contract = new ethers.Contract(contractAddress, contractABI, provider);
  return await contract.getUserTokens(address);
}