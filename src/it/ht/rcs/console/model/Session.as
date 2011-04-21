package it.ht.rcs.console.model
{
  import it.ht.rcs.console.accounting.User;
  import it.ht.rcs.console.utils.Clock;

  public class Session
  {
    [Bindable]
    public var user:User;
    
    public var fake:Boolean;
    
    public function Session(user:User, fake:Boolean = false)
    {
      /* is it a real session */
      this.fake = fake;
      
      /* the user of this session */
      this.user = user;

      /* set the locale of the current user */
      // FIXME: for some reason we cannot do this here, since the ResourceManager singleton is returing a sort of "read-only" impl
      //ResourceManager.getInstance().localeChain = [user.locale];
      
      /* update the clock timezone */
      Clock.instance.setConsoleTimezone(user.time_offset);
    }
    
    public function destroy():void
    {
      // TODO: logout the user from the db
      user = null;
    }
    
    
  }
}