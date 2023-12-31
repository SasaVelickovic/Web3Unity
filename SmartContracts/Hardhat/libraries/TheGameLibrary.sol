// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


///////////////////////////////////////////////////////////
// IMPORTS
///////////////////////////////////////////////////////////
import "classes/TransferLog.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

///////////////////////////////////////////////////////////
// LIBRARIES
///////////////////////////////////////////////////////////
library TheGameLibrary 
{
    ///////////////////////////////////////////////////////////
    // CONTANTS
    ///////////////////////////////////////////////////////////
    uint constant GoldOnRegister = 100;   
    uint constant GoldOnUnregister = 0;  
    uint constant PrizesOnRegister = 3;
    uint constant GoldOnTransfer = 25;   
    uint constant PrizesOnTransfer = 1;   
    uint constant GoldType = 1;  
    uint constant PrizeType = 2;  

    ///////////////////////////////////////////////////////////
    // FUNCTIONS: CONVERT
    ///////////////////////////////////////////////////////////
    function getRandomImageUrl () public pure returns (string memory imageUrl) 
    {
        //TODO: Randomize from a list of severl prize images
        imageUrl = "https://www.oregonlottery.org/wp-content/uploads/2020/03/trophy-illustration.jpg";
    }

    ///////////////////////////////////////////////////////////
    // FUNCTIONS: CONVERT
    ///////////////////////////////////////////////////////////
    function convertTransferLogToString (TransferLog memory transferLog) public pure returns (string memory transferLogString) 
    {
        require (transferLog.Type != 0, "Transfer Log Type Must Not Be 0");
        string memory fromAddressString = Strings.toHexString(transferLog.FromAddress);
        string memory toAddressString = Strings.toHexString(transferLog.ToAddress);
        string memory typeString = Strings.toString(transferLog.Type);
        string memory amountString = Strings.toString(transferLog.Amount);


        if (bytes(typeString).length == 0)
        {
            typeString = "0";
        }

        if (bytes(amountString).length == 0)
        {
            amountString = "0";
        }


        transferLogString = string(abi.encodePacked("FromAddress=", fromAddressString, "|ToAddress=", toAddressString, "|Type=", typeString, "|Amount=", amountString));
    }

    //TODO: This works great. It exists only for use in testTheGameLibrary.js. Can I move it from here?
    function createNewTransferLogForTesting () public pure returns (TransferLog memory transferLog)
    {
        transferLog = TransferLog (
        {
            FromAddress: address(0),
            ToAddress: address(0),
            Type: GoldType,
            Amount: 1
        });
    }

    //TODO: This works great. It exists only for use in testTheGameLibrary.js. Can I move it from here?
    function convertTransferLogToStringForTesting () public pure returns (string memory transferLogString)
    {
        TransferLog memory transferLog = createNewTransferLogForTesting();
        transferLogString =  convertTransferLogToString (transferLog);
    }
}