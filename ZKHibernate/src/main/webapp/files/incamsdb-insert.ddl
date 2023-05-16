INSERT INTO MUNIT VALUES (1, 'PPA', 'PPA');
INSERT INTO MUNIT VALUES (2, 'OPS', 'OPS');
INSERT INTO MUNIT VALUES (3, 'DIG', 'DIG');
INSERT INTO MUNIT VALUES (4, 'CAB', 'CABANG');
INSERT INTO MUNIT VALUES (5, 'MER', 'MERCHANT');
INSERT INTO MUNIT VALUES (6, 'VEN', 'VENDOR');

INSERT INTO MPRODUCTTYPE VALUES (1, 'ATM');
INSERT INTO MPRODUCTTYPE VALUES (2, 'JAKCARD');

INSERT INTO MUSERGROUP VALUES (0, 'ADM', 'ADMIN', 'USER GROUP FOR ADMIN', 'OPS', NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSERGROUP VALUES (1, 'OPS', 'GRUP OPS', 'USER GROUP FOR OPS', 'OPS', NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSERGROUP VALUES (2, 'PPA', 'GRUP PPA', 'USER GROUP FOR PPA', 'PPA', NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSERGROUP VALUES (3, 'CAB', 'CABANG', 'USER GROUP FOR CAB', 'CAB', NOW(), 'SYSTEM', NOW(), 'SYSTEM');

INSERT INTO MREGION VALUES (1, 'W01', 'JAKARTA SENAYAN', NOW(), 'SYSTEM');

INSERT INTO MBRANCH VALUES (1, 1, 'TBT', 'TEBET', 'JL.TEBET BARAT DALAM IV', 'JAKARTA SELATAN', 'Y', NOW(), 'SYSTEM');

INSERT INTO MUSER VALUES (0, 1, 0, 'ADMIN', 'SUPER ADMIN', 'ab58ac040da3df8abdf802756995e2bf', NOW(), NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSER VALUES (1, 1, 1, 'OPS', 'OPS USER', 'ab58ac040da3df8abdf802756995e2bf', NOW(), NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSER VALUES (2, 1, 2, 'PPA', 'PPA USER', 'ab58ac040da3df8abdf802756995e2bf', NOW(), NOW(), 'SYSTEM', NOW(), 'SYSTEM');
INSERT INTO MUSER VALUES (3, 1, 3, 'CABANG', 'CABANG USER', 'ab58ac040da3df8abdf802756995e2bf', NOW(), NOW(), 'SYSTEM', NOW(), 'SYSTEM');

INSERT INTO MMENU VALUES (0, 0, 'Organisasi', 'Organisasi', 'Grup User', '/view/admin/usergroup.zul', '', '', 'organisasi.png', 'groupuser.png', 'groupuser.png');
INSERT INTO MMENU VALUES (1, 1, 'Organisasi', 'Organisasi', 'Daftar User', '/view/admin/user.zul', '', '', 'organisasi.png', 'user.png', 'user.png');
INSERT INTO MMENU VALUES (7, 7, 'Organisasi', 'Organisasi', 'Cluster', '/view/parameter/region.zul', '', '', 'organisasi.png', 'wilayah.png', 'wilayah.png');
INSERT INTO MMENU VALUES (8, 8, 'Organisasi', 'Organisasi', 'Cabang', '/view/parameter/branch.zul', '', '', 'organisasi.png', 'cabang.png', 'cabang.png');
INSERT INTO MMENU VALUES (9, 9, 'Organisasi', 'Organisasi', 'Vendor', '/view/parameter/vendor.zul', '', '', 'organisasi.png', 'vendor.png', 'vendor.png');
--INSERT INTO MMENU VALUES (20, 20, 'Parameter', 'Parameter', 'Company Data', '/view/admin/companydata.zul', '', '', 'param.png', 'company.png', 'company.png');
INSERT INTO MMENU VALUES (29, 29, 'Master', 'Master', 'Tipe Kartu', '/view/parameter/producttype.zul', '', '', 'paramaster.png', 'jeniskartu.png', 'tipekartu.png');
INSERT INTO MMENU VALUES (30, 30, 'Master', 'Master', 'Jenis Kartu', '/view/parameter/product.zul', '', '', 'paramaster.png', 'jeniskartu.png', 'jeniskartu.png');
INSERT INTO MMENU VALUES (49, 49, 'PPA', 'PPA', 'Registrasi Pengadaan', '/view/procur/masterpengadaan.zul', '', '', 'pic.png', 'planning.png', 'planning.png');
INSERT INTO MMENU VALUES (54, 50, 'PPA', 'PPA', 'Approval Permintaan', '/view/ops/orderapproval.zul', 'arg', 'ppa', 'pic.png', 'decisionlogo.png', 'decisionlogo.png');
INSERT INTO MMENU VALUES (50, 50, 'PPA', 'PPA', 'Purches Order', '/view/ppa/orderrequestlist.zul', '', '', 'pic.png', 'embosslist.png', 'embosslist.png');
INSERT INTO MMENU VALUES (51, 51, 'PPA', 'PPA', 'Daftar PO', '/view/ppa/purcheslist.zul', '', '', 'pic.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (52, 52, 'PPA', 'PPA', 'Delivery Order', '/view/ppa/requestincoming.zul', '', '', 'pic.png', 'pod.png', 'pod.png'); --new icon
INSERT INTO MMENU VALUES (53, 53, 'PPA', 'PPA', 'Daftar DO', '/view/ppa/incominglist.zul', '', '', 'pic.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (70, 70, 'OPS', 'OPS', 'Form Pemesanan', '/view/ops/orderopsentry.zul', '', '', 'pic.png', 'usulan.png', 'usulan.png');
INSERT INTO MMENU VALUES (71, 71, 'OPS', 'OPS', 'Daftar Pemesanan', '/view/ops/orderopslist.zul', '', '', 'pic.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (72, 72, 'OPS', 'OPS', 'Generate Nomor Kartu', '/view/ops/orderopsgenerate.zul', '', '', 'pic.png', 'pembukuanfile.png', 'pembukuanfile.png');
INSERT INTO MMENU VALUES (76, 73, 'OPS', 'OPS', 'Approval Pemesanan', '/view/ops/orderapproval.zul', 'arg', 'ops', 'pic.png', 'decisionlogo.png', 'decisionlogo.png');
INSERT INTO MMENU VALUES (73, 73, 'OPS', 'OPS', 'Penerimaan Barang', '/view/ops/orderopsbast.zul', '', '', 'pic.png', 'pod.png', 'pod.png');
INSERT INTO MMENU VALUES (76, 74, 'OPS', 'OPS', 'Cetak BAST', '/view/ops/generatebastops.zul', '', '', 'pic.png', 'pembukuanfile.png', 'pembukuanfile.png');
INSERT INTO MMENU VALUES (74, 75, 'OPS', 'OPS', 'Approval Permintaan Cabang', '/view/ops/orderbranchapproval.zul', '', '', 'pic.png', 'decisionlogo.png', 'decisionlogo.png');
INSERT INTO MMENU VALUES (75, 76, 'OPS', 'OPS', 'Daftar Permintaan Cabang', '/view/ops/orderrequestbranch.zul', '', '', 'pic.png', 'getdata.png', 'getdata.png');
INSERT INTO MMENU VALUES (80, 80, 'DIG', 'DIG', 'Form Pemesanan', '/view/ops/orderopsentry.zul', '', '', 'pic.png', 'usulan.png', 'usulan.png');
INSERT INTO MMENU VALUES (81, 81, 'DIG', 'DIG', 'Daftar Pemesanan', '/view/ops/orderopslist.zul', '', '', 'pic.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (82, 82, 'DIG', 'DIG', 'Penerimaan Barang', '/view/ops/orderopsbast.zul', '', '', 'pic.png', 'pod.png', 'pod.png');
INSERT INTO MMENU VALUES (84, 83, 'DIG', 'DIG', 'Cetak BAST', '/view/ops/orderopsgenerate.zul', '', '', 'pic.png', 'pembukuanfile.png', 'pembukuanfile.png');
INSERT INTO MMENU VALUES (83, 84, 'DIG', 'DIG', 'Input Penjualan Kartu', '/view/cabang/orderbranchactivation.zul', '', '', 'pic.png', 'upload.png', 'upload.png'); --new menu
INSERT INTO MMENU VALUES (90, 90, 'Cabang', 'Cabang', 'Form Pemesanan', '/view/cabang/orderbranchentry.zul', '', '', 'cabang.png', 'usulan.png', 'usulan.png');
INSERT INTO MMENU VALUES (91, 91, 'Cabang', 'Cabang', 'Daftar Pemesanan', '/view/cabang/orderbranchlist.zul', '', '', 'cabang.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (93, 92, 'Cabang', 'Cabang', 'Cetak BAST', '/view/cabang/generatebastbranch.zul', '', '', 'cabang.png', 'pembukuanfile.png', 'pembukuanfile.png');
INSERT INTO MMENU VALUES (92, 93, 'Cabang', 'Cabang', 'Input Penjualan Kartu', '/view/cabang/orderbranchactivation.zul', '', '', 'cabang.png', 'upload.png', 'upload.png');
INSERT INTO MMENU VALUES (120, 120, 'Pengiriman', 'Pengiriman', 'Pemesanan Pengiriman', '/view/delivery/deliveryorder.zul', '', '', 'delivery.png', 'order.png', 'order.png');
INSERT INTO MMENU VALUES (121, 121, 'Pengiriman', 'Pengiriman', 'Daftar Pengiriman', '/view/delivery/deliverylist.zul', '', '', 'delivery.png', 'list.png', 'list.png');
INSERT INTO MMENU VALUES (122, 122, 'Pengiriman', 'Pengiriman', 'BAST Pengiriman', '/view/delivery/deliverybast.zul', '', '', 'delivery.png', 'pod.png', 'pod.png');
INSERT INTO MMENU VALUES (150, 150, 'Report', 'Report', 'Laporan Stok OPS', '/view/report/reportlist.zul', 'ops', 'ok', 'report.png', 'stockcabang.png', 'stockcabang.png');
INSERT INTO MMENU VALUES (151, 151, 'Report', 'Report', 'Laporan Stok Cabang', '/view/report/reportlist.zul', '', '', 'report.png', 'stockcabang.png', 'stockcabang.png');
INSERT INTO MMENU VALUES (85,85,'DIG','DIG','Approval Permintaan','/view/ops/orderdigapproval.zul','','','pic.png','usulan.png','usulan.png');
INSERT INTO mmenu VALUES (94,92,'Cabang','Cabang','Approval Pemesanan','/view/cabang/ordercabapproval.zul','','','cabang.png','decisionlogo.png','decisionlogo.png');


INSERT INTO MUSERGROUPMENU VALUES(0, 0, 0);