// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title Interaction Logger (no imports, no constructor, no input fields)
/// @notice Logs interactions (caller + timestamp + action tag). All functions accept NO inputs.
contract InteractionLogger {
    struct Interaction {
        uint256 id;
        address user;
        uint256 timestamp;
        bytes32 action; // small fixed tag (e.g. "ACTION_A"), zero for generic
    }

    Interaction[] private interactions;

    /// @dev Emitted when an interaction is logged
    event InteractionLogged(
        uint256 indexed id,
        address indexed user,
        uint256 timestamp,
        bytes32 action
    );

    /// @notice Log a generic interaction (no action tag)
    function logInteraction() public {
        uint256 id = interactions.length;
        interactions.push(Interaction(id, msg.sender, block.timestamp, bytes32(0)));
        emit InteractionLogged(id, msg.sender, block.timestamp, bytes32(0));
    }

    /// @notice Log an interaction with preset tag "ACTION_A"
    function logInteractionActionA() public {
        uint256 id = interactions.length;
        bytes32 tag = bytes32("ACTION_A");
        interactions.push(Interaction(id, msg.sender, block.timestamp, tag));
        emit InteractionLogged(id, msg.sender, block.timestamp, tag);
    }

    /// @notice Log an interaction with preset tag "ACTION_B"
    function logInteractionActionB() public {
        uint256 id = interactions.length;
        bytes32 tag = bytes32("ACTION_B");
        interactions.push(Interaction(id, msg.sender, block.timestamp, tag));
        emit InteractionLogged(id, msg.sender, block.timestamp, tag);
    }

    /// @notice Number of interactions logged
    function count() public view returns (uint256) {
        return interactions.length;
    }

    /// @notice Returns the most recent interaction
    /// @dev Reverts if no interactions
    function latest()
        public
        view
        returns (
            uint256 id,
            address user,
            uint256 timestamp,
            bytes32 action
        )
    {
        require(interactions.length > 0, "No interactions");
        Interaction storage it = interactions[interactions.length - 1];
        return (it.id, it.user, it.timestamp, it.action);
    }

    /// @notice Returns arrays of all interactions (ids, users, timestamps, actions)
    /// @dev Useful for light on-chain reads; returns empty arrays if none.
    function all()
        public
        view
        returns (
            uint256[] memory ids,
            address[] memory users,
            uint256[] memory timestamps,
            bytes32[] memory actions
        )
    {
        uint256 len = interactions.length;
        ids = new uint256[](len);
        users = new address[](len);
        timestamps = new uint256[](len);
        actions = new bytes32[](len);

        for (uint256 i = 0; i < len; i++) {
            Interaction storage it = interactions[i];
            ids[i] = it.id;
            users[i] = it.user;
            timestamps[i] = it.timestamp;
            actions[i] = it.action;
        }
    }
}
