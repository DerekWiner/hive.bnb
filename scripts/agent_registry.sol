// hive.bnb/scripts/agent_registry.sol
// Smart contract stub for Hive.bnb NFT: registers agents with subdomains & metadata

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HiveAgentRegistry {
    address public owner;

    struct Agent {
        string subdomain;
        string metadataHash; // Arweave/IPFS pointer to agent manifest
        bool active;
    }
    
    mapping(address => Agent) public agents;

    event AgentRegistered(address indexed agent, string subdomain);
    event AgentDeactivated(address indexed agent);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

        constructor() {
        owner = msg.sender;
    }
    
function registerAgent(string memory subdomain, string memory metadataHash) public {
        agents[msg.sender] = Agent(subdomain, metadataHash, true);
        emit AgentRegistered(msg.sender, subdomain);
    }

    function deactivateAgent() public {
        require(agents[msg.sender].active, "Agent not active");
        agents[msg.sender].active = false;
        emit AgentDeactivated(msg.sender);
    }

    function getAgent(address agentAddr) public view returns (string memory, string memory, bool) {
        Agent memory a = agents[agentAddr];
        return (a.subdomain, a.metadataHash, a.active);
    }
}
