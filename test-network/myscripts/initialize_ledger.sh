#!/bin/bash

peer chaincode invoke -C mychannel -n basic –c ‘{"Function":"InitLedger","Args":[]}’ \
    -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
    --peerAddresses localhost:7051 --peerAddresses localhost:9051 \
    --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
    --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
    --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt

peer chaincode query -C mychannel -n basic -c '{"Function":"GetAllAssets","Args":[]}'
