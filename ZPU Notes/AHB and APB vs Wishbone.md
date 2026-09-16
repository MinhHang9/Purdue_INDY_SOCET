# Wishbone vs AHB/APB
Last Edited : 09/16/2026 by Patchy Suanthong
Including:
- Added a paper summary for “Wishbone Bus Architecture: A Survey and Comparison”

# Paper 1
Source: Sharma & Kumar — “Wishbone Bus Architecture: A Survey and Comparison” (2012)
https://arxiv.org/pdf/1205.1860

The following table summarize the key differences between Wishbone and AMBA according to the paper

| Properties | Wishbone | AMBA | Note |
| ---------- | ------------------------------ | ------------------------------ | ------------------- | 
| **Licensing** | Free (Silicore + OpenCores) | Must be Registered (ARM) | |
| **Primary Usage** | Standard and reusable interface between IP Cores in SoC | Standard family of interfaces for connecting components in SoC | |
| **Hierachy** | No Hierachy, same interfaces for the entire system | Hierarchical with High Performance buses and Peripheral buses (_AHB_ -> _Bridge_ -> _APB_) | |
| **Protocol** | One Wishbone Protocol | Multiple Protocols such as AHB and APB | |
| **Master/Slaves** | Support Multiple Master and Slaves | Support Multiple Master and Slaves (APB behind a bridge) | |
| **General Topology** | point-to-point / shared bus / crossbar / dataflow | hierarchical, crossbar/matrix possible through multiple layers of AHB | |
| **Synchronous** | Yes | Yes | |
| **Handshaking** | Yes | Yes | |
| **Data transfer** | Single Read/Write | Read/write transfers | |
| **Burst / block transfer** | Yes | Yes | |
| **RMW (Read Write Modify) Cycle** | Yes | No Dedicated Transfer | |
| **Pipeline Transfer** | Mostly No | Yes | |
| **Split transfers** | No | Yes on AHB | |
| **Bus Width** | 8–64 bits | APB: 8/16/32 bits; AHB/ASB: 32/64/128/256 bits | |
| **Address Width** | 1–64 bits | 32 bits | |
| **Operating frequency** | Defined by User | Defined by User | |
## Notes:
- Wishbone does not have a fixed bus implementation, it's more of a specification, while AMBA is a family of buses.
- Wishbone emphasizes desginer's freedom over standardization
- These means that wishbone implementations on two different SoC can differs a lot.
- To understand how particular bus routes transactions, you need to inspect the ZPU system's HDL
- Paper is quite old (2012)