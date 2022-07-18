package vexriscv.periph.memory

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.eda.altera.QSysify
import spinal.lib.slave

object Apb3AVLCtrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3AVLCtrl(apb3Config : Apb3Config) extends Component {
  val io = new Bundle {
      val apb = slave(Apb3(Apb3AVLCtrl.getApb3Config))
  }

  val AVL_module = new Avalon_test_module
  val apbCtrl = Apb3SlaveFactory(io.apb)

  apbCtrl.driveAndRead(AVL_module.io.iChipselect, address=0)
  apbCtrl.driveAndRead(AVL_module.io.iWrite_n, address=4)
  apbCtrl.driveAndRead(AVL_module.io.iRead_n, address=8)
  apbCtrl.driveAndRead(AVL_module.io.iAddress, address=12)
  apbCtrl.driveAndRead(AVL_module.io.iData, address=16)

  //val resSyncBuf = RegNextWhen(gcdCtrl.io.res, gcdCtrl.io.ready)
  apbCtrl.read(AVL_module.io.oData, address=20)
}