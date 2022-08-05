package vexriscv.periph.poly1305

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.eda.altera.QSysify
import spinal.lib.slave

object Apb3Poly1305Ctrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3Poly1305Ctrl(apb3Config : Apb3Config) extends Component {
  val io = new Bundle {
      val apb = slave(Apb3(Apb3Poly1305Ctrl.getApb3Config))
  }

  val poly1305_module = new poly1305
  val apbCtrl = Apb3SlaveFactory(io.apb)

  apbCtrl.driveAndRead(poly1305_module.io.cs, address=0)
  apbCtrl.driveAndRead(poly1305_module.io.we, address=4)
  apbCtrl.driveAndRead(poly1305_module.io.address, address=8)
  apbCtrl.driveAndRead(poly1305_module.io.write_data, address=12)

  //val resSyncBuf = RegNextWhen(gcdCtrl.io.res, gcdCtrl.io.ready)
  apbCtrl.read(poly1305_module.io.read_data, address=16)
}