package vexriscv.periph.present

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.eda.altera.QSysify
import spinal.lib.slave

object Apb3PresentCtrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3PresentCtrl(apb3Config : Apb3Config) extends Component {
  val io = new Bundle {
      val apb = slave(Apb3(Apb3PresentCtrl.getApb3Config))
  }

  val present_module = new present
  val apbCtrl = Apb3SlaveFactory(io.apb)

  apbCtrl.driveAndRead(present_module.io.iChipselect_n, address=0)
  apbCtrl.driveAndRead(present_module.io.iWrite_n, address=4)
  apbCtrl.driveAndRead(present_module.io.iRead_n, address=8)
  apbCtrl.driveAndRead(present_module.io.iAddress, address=12)
  apbCtrl.driveAndRead(present_module.io.idat, address=16)

  //val resSyncBuf = RegNextWhen(gcdCtrl.io.res, gcdCtrl.io.ready)
  apbCtrl.read(present_module.io.odat, address=20)
}